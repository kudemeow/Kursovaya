using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfApp1
{
    public partial class AddWindow : Window
    {
        CinemaEntities db = new CinemaEntities();
        public AddWindow()
        {
            InitializeComponent();
        }

        private void PosterClick(object sender, RoutedEventArgs e)
        {
            Image img = new Image();
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.FileName = "";
            dlg.Filter = "*.jpg;*.jpeg;*.png";

            if (dlg.ShowDialog() == true)
            {
                img.Source = new BitmapImage(new Uri(dlg.FileName));
            }
        }
        //    private void SaveAddingClick(object sender, RoutedEventArgs e)
        //    {
        //        using (CinemaEntities db = new CinemaEntities())
        //        {
        //            var NameFilmSaveAdd = (from film in db.Film
        //                                   where film.NameFilm == NameFilmAdd.Text
        //                                   select film).FirstOrDefault();
        //            var IDDirectorSaveAdd = (from film in db.Film
        //                                     where film.Director_ID.ToString() == IDDirectorAdd.Text
        //                                     select film).FirstOrDefault();
        //            var NameGenreFilmSaveAdd = (from genre in db.Genre
        //                                        where genre.NameGenre == NameGenreAdd.Text
        //                                        select genre).FirstOrDefault();
        //            var DateOfReleaseSaveAdd = (from film in db.Film
        //                                        where film.ReleaseDate. == ReleaseDateAdd.
        //                             select film).FirstOrDefault();
        //            var DurationSaveAdd = (from film in db.Film
        //                                   where film.Duration.ToString() == DurationAdd.Text
        //                                   select film).FirstOrDefault();
        //            var IDDirectorSaveAdd = (from film in db.Film
        //                                     where film.Director_ID.ToString() == IDDirectorAdd.Text
        //                                     select film).FirstOrDefault();
        //            var NameGenreFilmSaveAdd = (from genre in db.Genre
        //                                        where genre.NameGenre == NameGenreAdd.Text
        //                                        select genre).FirstOrDefault();
        //            var DateOfReleaseSaveAdd = (from film in db.Film
        //                                        where film.ReleaseDate == ReleaseDateAdd.
        //                             select film).FirstOrDefault();
        //            var NameFilmSaveAdd = (from film in db.Film
        //                                   where film.NameFilm == NameFilmAdd.Text
        //                                   select film).FirstOrDefault();
        //            var IDDirectorSaveAdd = (from film in db.Film
        //                                     where film.Director_ID.ToString() == IDDirectorAdd.Text
        //                                     select film).FirstOrDefault();
        //            var NameGenreFilmSaveAdd = (from genre in db.Genre
        //                                        where genre.NameGenre == NameGenreAdd.Text
        //                                        select genre).FirstOrDefault();
        //            var DateOfReleaseSaveAdd = (from film in db.Film
        //                                        where film.ReleaseDate == ReleaseDateAdd.
        //                             select film).FirstOrDefault();
        //            var NameFilmSaveAdd = (from film in db.Film
        //                                   where film.NameFilm == NameFilmAdd.Text
        //                                   select film).FirstOrDefault();
        //            var IDDirectorSaveAdd = (from film in db.Film
        //                                     where film.Director_ID.ToString() == IDDirectorAdd.Text
        //                                     select film).FirstOrDefault();
        //            var NameGenreFilmSaveAdd = (from genre in db.Genre
        //                                        where genre.NameGenre == NameGenreAdd.Text
        //                                        select genre).FirstOrDefault();
        //            var DateOfReleaseSaveAdd = (from film in db.Film
        //                                        where film.ReleaseDate == ReleaseDateAdd.
        //                             select film).FirstOrDefault();
        //        }
        //    }
        //}
    }
}