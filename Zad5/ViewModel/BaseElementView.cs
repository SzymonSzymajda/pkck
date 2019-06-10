using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace ViewModel
{
    public abstract class BaseElementVM : BaseViewModel, IExpandable
    {
        public string Name { get; set; }

        public string Label
        {
            get
            {
                return ToString();
            }
        }

        public ObservableCollection<BaseElementVM> Children { get; set; }

        #region Fields
        private bool m_WasBuilt;
        private bool m_IsExpanded;
        #endregion

        public BaseElementVM()
        {
            Children = new ObservableCollection<BaseElementVM>() { null };
            this.m_WasBuilt = false;
        }

        public bool IsExpanded
        {
            get { return m_IsExpanded; }
            set
            {
                m_IsExpanded = value;
                if (m_WasBuilt)
                    return;
                Children.Clear();
                Expand();
                m_WasBuilt = true;
                RaisePropertyChanged(nameof(IsExpanded));
            }
        }

        public abstract void Expand();

        public void Add<T, D>(IEnumerable<T> collection, Func<T,D> del) where D : BaseElementVM
        {
            foreach (var item in collection)
            {
                Children.Add(del(item));
            }
        }
    }
}

