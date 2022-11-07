using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using WpfApp1;

namespace Kursach
{
    public partial class WindowUserApp : Window
    {
        public WindowUserApp()
        {
            InitializeComponent();

            FilmsShow.ItemsSource = CinemaEntities.GetContext().Film.ToList();
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
        private void Searcher_TextChanged(object sender, TextChangedEventArgs e)
        {
            string Text = Searcher.Text.ToLower().Trim();
                
            //if(Text == null) Text = "";

            FilmsShow.ItemsSource = CinemaEntities.GetContext().Film.ToList().Where(x =>
                Text.Split(' ').All(t => x.Director.LastName.ToLower().Contains(t)
                                        || x.Director.FirstName.ToLower().Contains(t))
                                        || x.Genre.Any(y => y.NameGenre.ToLower().Contains(Text))
                                        || x.NameFilm.ToLower().Contains(Text)
                );
        }
    }
}