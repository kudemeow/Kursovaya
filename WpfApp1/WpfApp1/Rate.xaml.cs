using System.Linq;
using System.Windows;
using System.Windows.Controls;
using WpfApp1;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для Rate.xaml
    /// </summary>
    public partial class Rate : Window
    {
        int currentFilmId;
        int ratingId = 0;

        public Rate(int CurrentFilmId)
        {
            InitializeComponent();

            currentFilmId = CurrentFilmId;
            using (CinemaEntities db = new CinemaEntities())
            {
                Rating lastRating = db.Rating.Where(rating => rating.Film_ID == CurrentFilmId &&
                                                    rating.Reviewer_ID == AppInfo.currentUserId).FirstOrDefault();
                choosenScore = (lastRating is null) ? 0 : (int)lastRating.Score;

                if (choosenScore != 0)
                {
                    ratingId = lastRating.NumberRating;
                    (RadioButtons.Children[choosenScore - 1] as RadioButton).IsChecked = true;
                }
            }
        }
        int choosenScore;
        private void ChooseScore_Checked(object sender, RoutedEventArgs e)
        {
            choosenScore = int.Parse((sender as RadioButton).Content.ToString());
        }
        private void RateButton_Click(object sender, RoutedEventArgs e)
        {
            if (choosenScore != 0)
            {
                using (CinemaEntities db = new CinemaEntities())
                {
                    if (ratingId == 0)
                    {
                        Rating ratingCurrentFilm = new Rating();
                        ratingCurrentFilm.Film_ID = currentFilmId;
                        ratingCurrentFilm.Score = choosenScore;
                        ratingCurrentFilm.Reviewer_ID = AppInfo.GetCurrentUser();

                        db.Rating.Add(ratingCurrentFilm);
                    }
                    else
                    {
                        Rating rating = db.Rating.Find(ratingId);
                        rating.Score = choosenScore;
                    }
                    db.SaveChanges();
                    this.Close();
                }
            }
        }
    }
}