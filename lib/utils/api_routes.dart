class ApiRoutes {
  final String login = '/login';
  final String getUsers = '/users';
  final String getTasks = '/tasks';
  final String getRoles = '/roles';
  final String createUser = '/register';
  final String createTask = '/tasks/create';
  final String getGroups = '/groups';
  final String getUserProfile = '/show';
  
  createAdminRoute(route) {
    return '/admin/$route';
  }
  createRoute(route) {
    return '$route';
  }
}

final ApiRoutes apiRoutes = ApiRoutes();