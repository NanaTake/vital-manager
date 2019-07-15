class Form::Vital < Vital
  REGISTRABLE_ATTRIBUTES = %i(
    record_date(1i) record_date(2i) record_date(3i)
    weight
    blood_pressure
    pulse
    memo
  )
end