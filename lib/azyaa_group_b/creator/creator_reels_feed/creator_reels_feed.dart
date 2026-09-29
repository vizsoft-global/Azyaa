import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_b/creator/creator_promotion/creator_promotion_widget.dart';
import '/azyaa_group_b/creator/creators_individual/creators_individual_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class _ReelPost {
  const _ReelPost({
    required this.creator,
    required this.promotion,
    required this.imageUrl,
  });

  final UsersRecord creator;
  final CreatorPromotionsStruct promotion;
  final String imageUrl;
}

/// Full-screen vertical posts for the Creators Hub, one promotion per page.
class CreatorReelsFeed extends StatelessWidget {
  const CreatorReelsFeed({super.key});

  static List<_ReelPost> postsFor(List<UsersRecord> creators) {
    final posts = <_ReelPost>[];
    for (final creator in creators) {
      if (creator.uid == currentUserUid) {
        continue;
      }
      for (final promotion in creator.creatorMainInfo.creatorPromotions) {
        if (promotion.promotionStatus != 'active') {
          continue;
        }
        final feature = promotion.promotionInfo.featureImage;
        final gallery = promotion.promotionInfo.galleryImage;
        final imageUrl = feature.isNotEmpty
            ? feature
            : (gallery.isNotEmpty ? gallery.first : '');
        if (imageUrl.isEmpty) {
          continue;
        }
        posts.add(_ReelPost(
          creator: creator,
          promotion: promotion,
          imageUrl: imageUrl,
        ));
      }
    }
    posts.sort((a, b) {
      final aTime = a.promotion.promotionCreatedAt;
      final bTime = b.promotion.promotionCreatedAt;
      if (aTime == null && bTime == null) {
        return 0;
      }
      if (aTime == null) {
        return 1;
      }
      if (bTime == null) {
        return -1;
      }
      return bTime.compareTo(aTime);
    });
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord
            .where(
              'status',
              isEqualTo: 'Published',
            )
            .where(
              'user_role',
              isEqualTo: 'Creator',
            )
            .where(
              'creator_main_info.creator_status',
              isEqualTo: 'active',
            ),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: LoadingAnimationWidget(),
          );
        }
        final posts = postsFor(snapshot.data!);
        if (posts.isEmpty) {
          return Center(
            child: EmptyWidget(
              messageOne: FFLocalizations.of(context).getText(
                'styqnzvy' /* No creator found! */,
              ),
              image: '',
              messageTwo: FFLocalizations.of(context).getText(
                'xuy0818g' /* Looks like there’s no data to ... */,
              ),
              buttonText: FFLocalizations.of(context).getText(
                'usfnod9k' /* Explore Creators */,
              ),
            ),
          );
        }
        return PageView.builder(
          scrollDirection: Axis.vertical,
          physics: const PageScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            final name = post.creator.displayName.isNotEmpty
                ? post.creator.displayName
                : post.creator.creatorMainInfo.creatorInfo.name;
            return Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: post.imageUrl,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0.0, -1.0),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Color(0xCC000000),
                        Color(0x00000000),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.pushNamed(
                              CreatorsIndividualWidget.routeName,
                              queryParameters: {
                                'creatorUid': serializeParam(
                                  post.creator.uid,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'almarai',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          CreatorPromotionWidget.open(
                            context,
                            promotionId: post.promotion.promotionId,
                            creatorUid: post.creator.uid,
                          );
                        },
                        text: FFLocalizations.of(context).getVariableText(
                          enText: 'Shop',
                          arText: 'تسوق',
                        ),
                        options: FFButtonOptions(
                          height: 36.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'almarai',
                                color: FlutterFlowTheme.of(context).info,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
