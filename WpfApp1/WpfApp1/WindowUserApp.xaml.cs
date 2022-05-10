using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using WpfApp1;

namespace Kursach
{
    public partial class WindowUserApp : Window
    {
        List<Film> films;
        public WindowUserApp()
        {
            InitializeComponent();

            CinemaEntities db = new CinemaEntities();
            FilmsShow.ItemsSource = db.Film.ToList();
        }
        private void ExitClick(object sender, RoutedEventArgs e)
        {
            Enter enter = new Enter();
            this.Close();
            enter.Show();
        }
        private void RateClick(object sender, RoutedEventArgs e)
        {
            int idFilm = ((sender as Button).DataContext as Film).Film_ID;
            Rate rate = new Rate(idFilm);
            rate.ShowDialog();
        }
        //private void ScoreCount()
        //{
        //    CinemaEntities db = new CinemaEntities();
        //    int rateScore = 0;
        //    var score = (from rating in db.Rating
        //                 where rating.Reviewer_ID == 1
        //                 select rating).FirstOrDefault();
        //    var all = (from rating in db.Rating
        //               select rating).FirstOrDefault();
            
        //    if(score != null)
        //    {
        //        for(int i = 0; i <= all; i++)
        //        {
        //            rateScore = (score + i) / all;
        //        }
        //    }

        //    ScoreShow.ItemsSource = rateScore;
        //}
        private void Searcher_TextChanged(object sender, TextChangedEventArgs e)
        {
            string Text = Searcher.Text.ToLower().Trim();
            FilmsShow.ItemsSource = films.Where(x=> Text.Split(' ').All(t =>
                x.Director.LastName.ToLower().Contains(t)
                || x.Director.FirstName.ToLower().Contains(t))
                || x.Genre.Any(y => y.NameGenre.ToLower().Contains(Text)) 
                || x.NameFilm.ToLower().Contains(Text));
        }
    }
}