abstract AbstractFinancialID
abstract AbstractInstrument

type CUSIP <: AbstractFinancialID
    id::String
end

type BloombergID <: AbstractFinancialID
    id::String
end

type ReutersID <: AbstractFinancialID
     id::String
end

type Stock <: AbstractInstrument
    ticker::String
    cusip::CUSIP
    currency::Currency
    tick::Float64
    multiplier::Float64
end

Stock(ticker::String, cusip::CUSIP) = Stock(ticker, cusip, USD, .01, 1)

############ show #################

function show(io::IO, c::CUSIP)
    print(io, @sprintf("%s: %s", typeof(c), c.id))
end

function show(io::IO, c::ReutersID)
    print(io, @sprintf("%s: %s", typeof(c), c.id))
end

function show(io::IO, c::BloombergID)
    print(io, @sprintf("%s: %s", typeof(c), c.id))
end

function show(io::IO, s::Stock)
    println(io, @sprintf("ticker: %s", s.ticker))
    println(io, @sprintf("cusip: %s", s.cusip))
    println(io, @sprintf("currency: %s", s.currency))
    println(io, @sprintf("tick: %s", s.tick))
    println(io, @sprintf("multiplier: %s", s.multiplier))
end
