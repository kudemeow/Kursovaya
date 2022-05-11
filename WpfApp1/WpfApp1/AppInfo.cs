namespace WpfApp1
{
    static class AppInfo
    {
        public static int currentUserId { get; set; }
        public static int GetCurrentUser() => currentUserId;
        public static void SetReviewer(int reviewer) => currentUserId = reviewer;
    }
}
