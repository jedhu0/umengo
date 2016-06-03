# Umengo

Inspiration comes from [umeng](https://github.com/menghuanwd/umeng)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'umengo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install umengo

## Usage

- params require  :data, :payload, :body

- params optional :extra, :extra, :policy

#### Android push params

```ruby
    android_params = {
      data: {
        alias_type: "xx",
        alias: "xx",
        file_id: "xx",
        filter: {},
        production_mode: "true/false",
        description: "xx",
        thirdparty_id: "xx"
      },
      payload: {
        display_type: "notifcation/message"
      },
      body: {
        ticker: "xxx",
        title: "xxx",
        text: "content",
        after_open: "xx",
        activity: "xx"
        icon: "xx",
        largeIcon: "xx",
        img: "xx",
        sound: "xx",
        builder_id: "xx",
        play_vibrate: "true/false",
        play_lights:" true/false",
        play_sound: "true/false",
        url: "xx",
        custom: "xx"/{}
      }
      extra: {
        key1: "value1",
      },
      policy: {
        start_time: "xx",
        expire_time: "xx",
        max_send_num: "xx",
        out_biz_no: "xx"
      }
    }

```

#### Ios push params
```ruby
    ios_params = {
      data: {
        alias_type: "xx",
        alias: "xx",
        file_id: "xx",
        filter: {},
        production_mode: "false",
        description: "xx",
        thirdparty_id: "xx"
      },
      body: {
        alert: "content",
        badge: "xx",
        sound: "xx",
        "content-available" => "xx",
        category: "xx"
        icon: "xx",
        largeIcon: "xx",
        img: "xx",
        sound: "xx",
        builder_id: "xx",
        play_vibrate: "true/false",
        play_lights:" true/false",
        play_sound: "true/false",
        url: "xx",
        custom: "xx"/{}
      }
      extra: {
        key1: "value1",
      },
      policy: {
        start_time: "xx",
        expire_time: "xx",
        max_send_num: "xx",
        out_biz_no: "xx"
      }
    }
```

```ruby
plantform = "ios/android"
client = Umengo::Client.new(appkey, app_master_secret, plantform)
```

##### broadcast
```
client.broadcast(android_params)
```


##### unicast
```
client.unicast(device_tokens, android_params)
```

##### listcast
```
client.listcast(device_tokens, android_params)
```


## Development


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/umengo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
