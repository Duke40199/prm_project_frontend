class ApiRoutes {
  final String login = '/login';
  final String getUsers = '/users';
  final String createUsers = '/create-user';
  final String getGroups = '/groups';
  final String getUserProfile = '/show';
  
  createAdminRoute(route) {
    return '/admin/$route';
  }
}

final ApiRoutes apiRoutes = ApiRoutes();