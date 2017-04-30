require ('open-uri')
require ('json')
class HomeController < ApplicationController
  def index
  end
  def result
    @lotto_hash = JSON.parse(open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=').read)
    
    @pick_number = [*1..45].sample(6).sort!
    
    @drwt=[]
    @lotto_hash.each do |x, y|
        if x.include?"drwtNo"
          @drwt << y
        end
    end
    @drwt_number=@drwt.sort!      
        
    @bnus=[]
    @lotto_hash.each do |x, y|
      if x.include?"bnusNo"
        @bnus << y
      end
    end
    
    @winning_number = @pick_number & @drwt_number
    
    @winning_count = @winning_number.count
  end
end
