module BalanceSheetsHelper
  def cdg_array
    cdg = [{ name: 'CDG',
             data: { 'Jan': 56_256, 'Fev': 58_156, 'Mar': 50_760, 'Abr': 31_836,
                     'Mai': 35_928, 'Jun': 29_037, 'Jul': 35_742, 'Ago': 0,
                     'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } },
           { name: 'CDG modificado',
             data: { 'Jan': 7_808, 'Fev': 10_262, 'Mar': 13_284, 'Abr': 23_379,
                     'Mai': 25_693, 'Jun': 28_424, 'Jul': 19_893, 'Ago': 0,
                     'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } }]

    cdg
  end

  def ncg_teso_array
    ncg = [{ name: 'NCG',
             data: { 'Jan': 6_762, 'Fev': 7_813, 'Mar': 10_111, 'Abr': 19_926,
                     'Mai': 24_608, 'Jun': 29_565, 'Jul': 19_473, 'Ago': 0,
                     'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } },
           { name: 'Tesouraria',
             data: { 'Jan': 63_018, 'Fev': 65_968, 'Mar': 60_871, 'Abr': 51_762,
                     'Mai': 60_536, 'Jun': 58_602, 'Jul': 55_215, 'Ago': 0,
                     'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } }]

    ncg
  end

  def div_endv_array
    endv = [{ name: 'Curto prazo',
              data: { 'Jan': 62_786 , 'Fev': 65_884, 'Mar': 63_259, 'Abr': 61_066,
                      'Mai': 60_297, 'Jun': 58_382, 'Jul': 54_796, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } },
            { name: 'Longo prazo',
              data: { 'Jan': 108_601, 'Fev': 109_272, 'Mar': 110_711, 'Abr': 130_755,
                      'Mai': 129_155, 'Jun': 150_582, 'Jul': 150_624, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } }]
    endv
  end

  def var_dancg_array
    vncg = [{ name: 'Variação da NCG',
              data: { 'Jan': 3_897, 'Fev': 1_051, 'Mar': 2_299, 'Abr': 9_815,
                      'Mai': 4_682, 'Jun': 4_957, 'Jul': 10_092, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } },
            { name: 'Ciclo financeiro em dias',
              data: { 'Jan': 35, 'Fev': 46, 'Mar': 66, 'Abr': 96,
                      'Mai': 99, 'Jun': 94, 'Jul': 77, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } }]
    vncg
  end

  def endividamento_array
    endiv = [{ name: 'Creditos terceiros cp',
              data: { 'Jan': 5_080, 'Fev': 4_799, 'Mar': 5_237, 'Abr': 3_933,
                      'Mai': 4_462, 'Jun': 1_996, 'Jul': 1_972, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } },
            { name: 'Debito renegociavel',
              data: { 'Jan': 10_829, 'Fev': 10_354, 'Mar': 9_454, 'Abr': 9_847,
                      'Mai': 10_212, 'Jun': 13_186, 'Jul': 12_295, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } },
            { name: 'Creditos terceiros lp',
              data: { 'Jan': 1_644, 'Fev': 1_644, 'Mar': 1_644, 'Abr': 1_644,
                      'Mai': 1_644, 'Jun': 1_574, 'Jul': 1_574, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } },
            { name: 'Debitos fiscais ren.',
              data: { 'Jan': 44_227, 'Fev': 44_227, 'Mar': 44_227, 'Abr': 42_943,
                      'Mai': 42_514, 'Jun': 43_096, 'Jul': 42.853, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } },
            { name: 'Emprestimos',
              data: { 'Jan': 62_730, 'Fev': 63_400, 'Mar': 63_760, 'Abr': 64_201,
                      'Mai': 64_425, 'Jun': 65_104, 'Jul': 65_671, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } }]
    endiv
  end

  def evo_endiv_array
    endv = [{ name: 'Endividamento',
              data: { 'Jan': 171_387, 'Fev': 175_156, 'Mar': 173_970, 'Abr': 191_821,
                      'Mai': 189_452, 'Jun': 208_965, 'Jul': 205_420, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 },
              library: { type: 'bar',
                         color: 'orange' } },
            { name: 'Dívida Líquida',
              data: { 'Jan': 171_273, 'Fev': 174_986, 'Mar': 171_465, 'Abr': 182_297,
                      'Mai': 189_381, 'Jun': 208_806, 'Jul': 205_283, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 },
              library: { type: 'bar',
                         color: 'red' } },
            { name: 'Dív. Liq. / Ebitda Rec. (x)',
              data: { 'Jan': 25, 'Fev': 114, 'Mar': 84, 'Abr': 93,
                      'Mai': 132, 'Jun': -70, 'Jul': -39, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 },
              library: { type: 'line',
                         color: 'black',
                         stacked: true } }]
    endv
  end

  def evo_div_lpcp_array
    endv = [{ name: 'Curto Prazo',
              data: { 'Jan': 37, 'Fev': 38, 'Mar': 36, 'Abr': 32,
                      'Mai': 32, 'Jun': 28, 'Jul': 27, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } },
            { name: 'Longo Prazo',
              data: { 'Jan': 63, 'Fev': 62, 'Mar': 64, 'Abr': 68,
                      'Mai': 68, 'Jun': 72, 'Jul': 73, 'Ago': 0,
                      'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 } }]
    endv
  end
end


