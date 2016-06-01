require 'umengo/util'
require 'umengo/params'

module Umengo
  module Service
    include Umengo::Util

    # 消息发送
    # POST http://msg.umeng.com/api/send?sign=mysign
    def push(type, opts={})
      uri = 'api/send'
      data = opts.fetch(:data, {}).merge({
        appkey: @appkey,
        timestamp: Time.now.to_i
      })

      payload = opts.fetch(:payload, { display_type: "notifcation"} )

      params = Params.new(
        data,
        payload,
        opts[:body],
        opts[:extra],
        opts[:policy]
      ).send "build_#{type}"

      perform(uri, params)
    end

    # 查看状态
    # POST http://msg.umeng.com/api/status?sign=mysign
    def status(task_id)
      uri = 'api/status'
      params = {
        appkey: @appkey,
        timestamp: Time.now.to_i,
        task_id: task_id
      }

      perform(uri, params)
    end

    #取消任务
    #POST http://msg.umeng.com/api/cancel?sign=mysign
    def cancel(task_id)
      uri = 'api/cancel'
      params = {
        appkey: @appkey,
        timestamp: Time.now.to_i,
        task_id: task_id
      }

      perform(uri, params)
    end
  end
end
