# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Inserting default security users
users = {

    admin: {

        username: 'admin',
        email: 'tuvarna.system.master@gmail.com',
        password: 'adminpass',
        password_confirmation: 'adminpass',
        is_admin: true
    },

    administrator: {

        username: 'administrator',
        email: 'tuvarna.system.super.user@gmail.com',
        password: 'administrator',
        password_confirmation: 'administrator',
        is_admin: true
    }
}

users.each do |user, data|

  user = User.new(data)

  unless User.where(email: user.email).exists?
    user.save!
  end
end

# Inserting default demo gems
gems = {

    railslider: {

        name: 'RailSlider',
        description: 'Introduces simple images slider for rails applications using CSS3 animations for image transitions.',
        image: File.new(File.join(Rails.root, '/public/images/SliderDemoImage.png')),
        github: 'https://github.com/gotqn/railslider',
        rubygems: 'https://rubygems.org/gems/railslider',
        code: '"#{DemoSlider.new({id:\'demo\'}).render}
              <script type=\'text/javascript\'>//Checking if jQuery function is loaded
              (function IsjQueryLoaded(){
                  if(window.jQuery){
                      //Waiting for all elements to be rendered
                      $(document).ready(function(){
                          //Creating new instance of \'RailSlider\'
                          demo = new RailSlider({\'containerID\':\'demo\'});
                          demo.init();
                          demo.controls.show()
                      });
                  }else{
                      setTimeout(IsjQueryLoaded(),1000);
                  }
              })();</script>"'
    },

    thumbnailhovereffect: {

        name: 'Thumbnail Hover Effect',
        description: 'Introduces simple thumbnail 3D image hover effects using CSS 3D transforms.',
        image: File.new(File.join(Rails.root, '/public/images/HoverDemoImage.png')),
        github: 'https://github.com/gotqn/thumbnail_hover_effect',
        rubygems: 'https://rubygems.org/gems/thumbnail_hover_effect',
        code: '"#{DemoHover.new.render({effect_number:1})}
                #{DemoHover.new.render({effect_number:2})}
                #{DemoHover.new.render({effect_number:3})}
                #{DemoHover.new.render({effect_number:4})}"'
    }
}

gems.each do |user, data|

  gem = DemoGem.new(data)

  unless DemoGem.where(name: gem.name).exists?
    gem.save!
  end
end


