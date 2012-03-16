# encoding: utf-8
require 'acceptance/acceptance_helper'

feature 'Galleries', '' do

  background do
    user = FactoryGirl.create(:user)
    login_as(user)
  end

  scenario 'Some crud for admin' do
    click_link('Galerie (0)')
    page.should have_content('Galerie')
    click_link('Přidat galerii »')
    click_button('Uložit')
    page.should have_content('Nadpis je povinná položka')
    fill_in 'Nadpis', :with => 'A title with české znaky ěščřžýáíé'
    click_button('Uložit')
    page.should have_content('Galerie byla úspěšně vytvořena.')
    gallery = EtabliocmsGalleries::Gallery.last
    gallery.title.should == 'A title with české znaky ěščřžýáíé'
    gallery.slug.should == 'a-title-with-ceske-znaky-escrzyaie'
    click_link(gallery.title)
    fill_in 'Nadpis', :with => 'Change!'
    click_button('Uložit')
    page.should have_content('Galerie byla úspěšně upravena.')
    gallery.reload.title.should == "Change!"
  end

end
