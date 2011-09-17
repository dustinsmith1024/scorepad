class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def pubnub
    @pubnub ||= Pubnub.new(
      'pub-c82313ac-0539-4360-a94a-ca61815162e1',
      'sub-8f210f63-de68-11e0-87ea-fd1c1c3f5d78',
      "",      ## SECRET_KEY
      false    ## SSL_ON?
    )

  end

  def publish(options={})
    o = {:channel => 'hello_world', :message => 'sup??'}.merge(options)
    info = pubnub.publish({
      'channel' => o[:channel],
      'message' => o[:message]
    })

    if info[0]==0  #FAILED PUBLISH
      print info[1]
    end

  end

end
