﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp1
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CinemaEntities : DbContext
    {
        public CinemaEntities()
            : base("name=CinemaEntities")
        {
        }
        private static CinemaEntities context = new CinemaEntities();
        public static CinemaEntities GetContext() => context;


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Actor> Actor { get; set; }
        public virtual DbSet<Administrator> Administrator { get; set; }
        public virtual DbSet<Casting> Casting { get; set; }
        public virtual DbSet<Director> Director { get; set; }
        public virtual DbSet<Film> Film { get; set; }
        public virtual DbSet<Genre> Genre { get; set; }
        public virtual DbSet<Rating> Rating { get; set; }
        public virtual DbSet<Reviewer> Reviewer { get; set; }
    }
}
