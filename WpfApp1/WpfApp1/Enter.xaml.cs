using System.Windows;
using System.Linq;
using WpfApp1;
using System.Windows.Input;

namespace Kursach
{
    public partial class Enter : Window
    {
        public Enter()
        {
            InitializeComponent();
        }
        public void ClickEnter(object sender, RoutedEventArgs e)
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                var sqlReviewer = (from reviewer in db.Reviewer
                                   where reviewer.LoginR == EnterLogin.Text && reviewer.PasswordR == EnterPassword.Password
                                   select reviewer).FirstOrDefault();

                if (sqlReviewer != null)
                {
                    AppInfo.SetReviewer(sqlReviewer.Reviewer_ID);

                    WindowUserApp mainApp = new WindowUserApp();
                    this.Close();
                    mainApp.Show();
                }
                else
                {
                    var sqlAdmin = (from administrator in db.Administrator
                                    where administrator.LoginA == EnterLogin.Text && administrator.PasswordA == EnterPassword.Password
                                    select administrator).FirstOrDefault();

                    if (sqlAdmin != null)
                    {
                        WindowAdminApp mainAppAdmin = new WindowAdminApp();
                        this.Close();
                        mainAppAdmin.Show();
                    }
                    else
                    {
                        MessageBox.Show("Пользователь не найден", "", MessageBoxButton.OK);
                    }
                }
            }
        }
        private void ClickRegistration(object sender, RoutedEventArgs e)
        {
            Registration registration = new Registration();
            registration.Show();
        }
    }
}
