using System.Windows;
using WpfApp1;
using System.Linq;

namespace Kursach
{
    public partial class Registration : Window
    {
        public Registration()
        {
            InitializeComponent();
        }
        public void ClickSave(object sender, RoutedEventArgs e)
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                var LogRew = (from reviewer in db.Reviewer
                              where reviewer.LoginR == LoginReg.Text
                              select reviewer).FirstOrDefault();
                var LogAdm = (from administator in db.Administrator
                              where administator.LoginA == LoginReg.Text
                              select administator).FirstOrDefault();
                var FamiliyaR = (from reviewer in db.Reviewer
                                 where reviewer.Familiya == Familiya.Text
                                 select reviewer).FirstOrDefault();
                var ImyaR = (from reviewer in db.Reviewer
                             where reviewer.Imya == Imya.Text
                             select reviewer).FirstOrDefault();

                if (LogRew != null || LogAdm != null)
                {
                    MessageBox.Show("Такой пользователь уже существует. Введите другой логин", "", MessageBoxButton.OK);
                }
                else
                {
                    Reviewer reviewer = new Reviewer()
                    {
                        LoginR = LoginReg.Text,
                        PasswordR = PasswordReg.Password,
                        Familiya = Familiya.Text,
                        Imya = Imya.Text
                    };
                    if (!string.IsNullOrWhiteSpace(LoginReg.Text) && !string.IsNullOrWhiteSpace(PasswordReg.Password)
                        && !string.IsNullOrWhiteSpace(Familiya.Text) && !string.IsNullOrWhiteSpace(Imya.Text))
                    {
                        db.Reviewer.Add(reviewer);
                        db.SaveChanges();
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Проверьте правильность ввода данных", "", MessageBoxButton.OK);
                    }
                }
            }
        }
    }
}