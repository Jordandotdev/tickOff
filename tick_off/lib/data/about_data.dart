Future<Map<String, dynamic>> getAboutData() async {
  await Future.delayed(Duration(seconds: 1));
  return {
    'title': 'About Tick Off',
    'description':
        'Tick Off is a user-friendly task management app designed to help you organize, prioritize, and complete your daily tasks with ease. Whether youre planning your work schedule, managing personal projects, or keeping track of your daily to-dos, Tick Off provides a seamless experience for creating and ticking off tasks. With a clean interface and intuitive features, you can quickly add new tasks, set deadlines, and mark them as complete once they are done. Stay on top of your responsibilities and boost your productivity with Tick Off—because every tick brings you closer to your goals.',
    'version': 'Version 1.0.0'
  };
}
