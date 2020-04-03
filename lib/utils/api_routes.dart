class ApiRoutes {
  final String login = '/login';
  final String getUsers = '/users';
  final String getTasks = '/tasks';
  final String getReviewTasks = '/tasks/reviews';
  final String getRoles = '/roles';
  final String createUser = '/register';
  final String createRating = '/ratings';
  final String createTask = '/tasks/create';
  final String updateTask = '/tasks/update';
  final String getGroups = '/groups';
  final String getUserProfile = '/show';
  final String getStatus = '/status';
  createAdminRoute(route) {
    return '/admin/$route';
  }
  createRoute(route) {
    return '$route';
  }
}

final ApiRoutes apiRoutes = ApiRoutes();