using Kursach;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace WpfApp1
{
    public partial class WindowAdminApp : Window
    {
        List<Film> films;
        List<Reviewer> reviewers;
        List<Actor> actors; 
        List<Administrator> administrators;
        List<Casting> castings;
        List<Director> directors;
        List<Rating> ratings;
        List<Genre> genres;
        public WindowAdminApp()
        {
            InitializeComponent();
        }
        private void OpenFilms(object sender, RoutedEventArgs e)
        {
            films = CinemaEntities.GetContext().Film.ToList();
            Tables.ItemsSource = films;
        }
        private void OpenUsers(object sender, RoutedEventArgs e)
        {
            reviewers = CinemaEntities.GetContext().Reviewer.ToList();
            Tables.ItemsSource = reviewers;
        }
        private void OpenAdmins(object sender, RoutedEventArgs e)
        {
            administrators = CinemaEntities.GetContext().Administrator.ToList();
            Tables.ItemsSource = administrators;
        }
        private void OpenActors(object sender, RoutedEventArgs e)
        {
            actors = CinemaEntities.GetContext().Actor.ToList();
            Tables.ItemsSource = actors;
        }
        private void OpenCasting(object sender, RoutedEventArgs e)
        {
            castings = CinemaEntities.GetContext().Casting.ToList();
            Tables.ItemsSource = castings;
        }
        private void OpenGenres(object sender, RoutedEventArgs e)
        {
            genres = CinemaEntities.GetContext().Genre.ToList();
            Tables.ItemsSource = genres;
        }
        private void OpenDirectors(object sender, RoutedEventArgs e)
        {
            directors = CinemaEntities.GetContext().Director.ToList();
            Tables.ItemsSource = directors;
        }
        private void OpenRates(object sender, RoutedEventArgs e)
        {
            ratings = CinemaEntities.GetContext().Rating.ToList();
            Tables.ItemsSource = ratings;
        }
        private void DeleteClick(object sender, RoutedEventArgs e)
        {
            if((sender as Button).DataContext is Film film)
            {
                CinemaEntities.GetContext().Film.Remove(film);
                CinemaEntities.GetContext().SaveChanges();
                Tables.ItemsSource = CinemaEntities.GetContext().Film.ToList(); ;
            }
            else if ((sender as Button).DataContext is Reviewer reviewer)
            {
                CinemaEntities.GetContext().Reviewer.Remove(reviewer);
                CinemaEntities.GetContext().SaveChanges();
                Tables.ItemsSource = CinemaEntities.GetContext().Reviewer.ToList(); ;
            }
            else if((sender as Button).DataContext is Administrator administrator)
            {
                CinemaEntities.GetContext().Administrator.Remove(administrator);
                CinemaEntities.GetContext().SaveChanges();
                Tables.ItemsSource = CinemaEntities.GetContext().Administrator.ToList(); ;
            }
            else if((sender as Button).DataContext is Actor actor)
            {
                CinemaEntities.GetContext().Actor.Remove(actor);
                CinemaEntities.GetContext().SaveChanges();
                Tables.ItemsSource = CinemaEntities.GetContext().Actor.ToList(); ;
            }
            else if((sender as Button).DataContext is Casting casting)
            {
                CinemaEntities.GetContext().Casting.Remove(casting);
                CinemaEntities.GetContext().SaveChanges();
                Tables.ItemsSource = CinemaEntities.GetContext().Casting.ToList(); ;
            }
            else if((sender as Button).DataContext is Director director)
            {
                CinemaEntities.GetContext().Director.Remove(director);
                CinemaEntities.GetContext().SaveChanges();
                Tables.ItemsSource = CinemaEntities.GetContext().Director.ToList(); ;
            }
            else if((sender as Button).DataContext is Genre genre)
            {
                CinemaEntities.GetContext().Genre.Remove(genre);
                CinemaEntities.GetContext().SaveChanges();
                Tables.ItemsSource = CinemaEntities.GetContext().Genre.ToList(); ;
            }
            else if((sender as Button).DataContext is Rating rating)
            {
                CinemaEntities.GetContext().Rating.Remove(rating);
                CinemaEntities.GetContext().SaveChanges();
                Tables.ItemsSource = CinemaEntities.GetContext().Rating.ToList(); ;
            }

            Tables.Items.Refresh();
        }
        private void AddClick(object sender, RoutedEventArgs e)
        {
            if ((sender as Button).DataContext is Film film)
            {
                CinemaEntities.GetContext().SaveChanges();
                CinemaEntities.GetContext().Film.Add(film);
                Tables.ItemsSource = CinemaEntities.GetContext().Film.ToList();
            }
            else if ((sender as Button).DataContext is Reviewer reviewer)
            {
                CinemaEntities.GetContext().SaveChanges();
                CinemaEntities.GetContext().Reviewer.Add(reviewer);
                Tables.ItemsSource = CinemaEntities.GetContext().Reviewer.ToList();
            }
            else if ((sender as Button).DataContext is Administrator administrator)
            {
                CinemaEntities.GetContext().SaveChanges();
                CinemaEntities.GetContext().Administrator.Add(administrator);
                Tables.ItemsSource = CinemaEntities.GetContext().Administrator.ToList();
            }
            else if ((sender as Button).DataContext is Actor actor)
            {
                CinemaEntities.GetContext().SaveChanges();
                CinemaEntities.GetContext().Actor.Add(actor);
                Tables.ItemsSource = CinemaEntities.GetContext().Actor.ToList();
            }
            else if ((sender as Button).DataContext is Casting casting)
            {
                CinemaEntities.GetContext().SaveChanges();
                CinemaEntities.GetContext().Casting.Add(casting);
                Tables.ItemsSource = CinemaEntities.GetContext().Casting.ToList();
            }
            else if ((sender as Button).DataContext is Director director)
            {
                CinemaEntities.GetContext().SaveChanges();
                CinemaEntities.GetContext().Director.Add(director);
                Tables.ItemsSource = CinemaEntities.GetContext().Director.ToList();
            }
            else if ((sender as Button).DataContext is Rating rating)
            {
                CinemaEntities.GetContext().SaveChanges();
                CinemaEntities.GetContext().Rating.Add(rating);
                Tables.ItemsSource = CinemaEntities.GetContext().Rating.ToList();
            }
            else if ((sender as Button).DataContext is Genre genre)
            {
                CinemaEntities.GetContext().SaveChanges();
                CinemaEntities.GetContext().Genre.Add(genre);
                Tables.ItemsSource = CinemaEntities.GetContext().Genre.ToList();
            }

            CinemaEntities.GetContext().SaveChanges();
            Tables.Items.Refresh();
        }
        private void EditClick(object sender, RoutedEventArgs e)
        {
            if ((sender as Button).DataContext is Film)
            {
                Tables.ItemsSource = CinemaEntities.GetContext().Film.ToList();
            }
            else if ((sender as Button).DataContext is Reviewer)
            {
                Tables.ItemsSource = CinemaEntities.GetContext().Reviewer.ToList();
            }
            else if ((sender as Button).DataContext is Administrator)
            {
                Tables.ItemsSource = CinemaEntities.GetContext().Administrator.ToList();
            }
            else if ((sender as Button).DataContext is Actor)
            {
                Tables.ItemsSource = CinemaEntities.GetContext().Actor.ToList();
            }
            else if ((sender as Button).DataContext is Casting)
            {
                Tables.ItemsSource = CinemaEntities.GetContext().Casting.ToList();
            }
            else if ((sender as Button).DataContext is Director)
            {
                Tables.ItemsSource = CinemaEntities.GetContext().Director.ToList();
            }
            else if ((sender as Button).DataContext is Rating)
            {
                Tables.ItemsSource = CinemaEntities.GetContext().Rating.ToList();
            }
            else if ((sender as Button).DataContext is Genre)
            {
                Tables.ItemsSource = CinemaEntities.GetContext().Genre.ToList();
            }

            CinemaEntities.GetContext().SaveChanges();
            Tables.Items.Refresh();
        }
        private void ExitClick(object sender, RoutedEventArgs e)
        {
            Enter enter = new Enter();
            this.Close();
            enter.Show();
        }
    }
}