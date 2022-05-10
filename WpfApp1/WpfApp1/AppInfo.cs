using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfApp1
{
    static class AppInfo {
        public static int currentUserId { get; set; }
        public static int GetCurrentUser() => currentUserId;
        public static void SetReviewer(int reviewer) => currentUserId = reviewer;
    }
}
