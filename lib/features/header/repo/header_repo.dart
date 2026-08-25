import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/features/header/model/header_model.dart';

class HeaderRepo {
  HeaderModel getHeaderData() {
    return const HeaderModel(
      name: AppConstants.name,
      role: AppConstants.role,
      badgeTag: AppConstants.badgeTag,
      profileAsset: AppConstants.profileImg,
      metrics: [
        MetricItem(
          count: AppConstants.expYears,
          label: AppConstants.expYearsLabel,
        ),
        MetricItem(
          count: AppConstants.projectsCount,
          label: AppConstants.projectsLabel,
        ),
        MetricItem(
          count: AppConstants.reachCount,
          label: AppConstants.reachLabel,
        ),
      ],
    );
  }
}
