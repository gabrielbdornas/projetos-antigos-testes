class ExceptionsController < ApplicationController
  def index
    @rules = data_rules
    sql = "SELECT
      ba.\"group\", SUM(ba.sum_end) FROM (
      SELECT \"group\", SUM (end_balance) AS sum_end
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE ii.id = 11
      GROUP BY \"group\"
      ORDER BY 1
      ) ba
      GROUP BY ba.\"group\""
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result = ImportAccount.find_by_sql(sql)
  end

  def data_rules
    rules_data = [
      { number: 1,
        description: 'O balancete deve ter a seguinte ordem: Ativo (A), Ativo Circulante (AC), Ativo Não Circulante (ACN), Passivo e Patrimônio Líquido (PPL), Passivo Circulante (PC), Passivo Não Circulante (PNC), Patrimônio Líquido (PL), Receitas (R), Custos (C), Despesas (D)',
        status: '' },
      { number: 2,
        description: 'As contas contábeis do Ativo (CCA) começam com o número 1',
        status: '' },
      { number: 3,
        description: 'As contas contábeis do Passivo e Patrimônio Líquido (CCPL) começam com o número 2',
        status: '' },
      { number: 4,
        description: 'As contas contábeis de Receita (CCR) da DRE começam com o número 3 ou 4',
        status: '' },
      { number: 5,
        description: 'As contas contábeis de Custos e Despesas (CCCD) da DRE começam com o número 3 ou 4',
        status: '' },
      { number: 6,
        description: 'O total de débitos deve ser igual ao total de créditos',
        status: '' },
      { number: 7,
        description: 'Equação patrimonial deve ser sempre verdadeira',
        status: '' },
      { number: 8,
        description: 'Os débitos nas contas de ativo, passivo e patrimôno líquido (D) são positivos',
        status: '' },
      { number: 9,
        description: 'Os créditos nas contas de ativo, passivo e patrimônio líquido (C) são negativos',
        status: '' },
      { number: 10,
        description: 'Os débitos nas contas de receitas, custos e despesas (D) são negativos',
        status: '' },
      { number: 11,
        description: 'Os créditos nas contas de receitas, custos e despesas (C) são positivos',
        status: '' },
      { number: 12,
        description: 'Os ativos tem natureza devedora',
        status: '' },
      { number: 13,
        description: 'Os passivos e o patrimônio líquido tem natureza credora',
        status: '' },
      { number: 14,
        description: 'As receitas tem natureza credora',
        status: '' },
      { number: 15,
        description: 'Os custos e as despesas tem natureza devedora',
        status: '' },
      { number: 16,
        description: 'A PCLD (Provisão para Créditos de Liquidação Duvidosa) contabilizada como redutora da conta de Clientes tem natureza credora',
        status: '' },
      { number: 17,
        description: 'A Provisão para Estoques de Baixa Movimentação contabilizada como redutora da conta de Estoques tem natureza credora',
        status: '' },
      { number: 18,
        description: 'A Provisão para Perdas em Estoques contabilizada como redutora da conta de Estoques tem natureza credora',
        status: '' },
      { number: 19,
        description: 'A Provisão para Obsolescência de Estoques contabilizada como redutora da conta de Estoques tem natureza credora',
        status: '' },
      { number: 20,
        description: 'A conta Outros Ativos Circulantes (OAC) não pode representar mais que 10% do total da conta de Ativo Circulante (AC)',
        status: '' },
      { number: 21,
        description: 'A conta Outros Contas a Receber (OCR) não pode representar mais que 10% do total da conta de Ativo Circulante (AC)',
        status: '' },
      { number: 22,
        description: 'A conta de Provisão para Perdas em Investimentos contabilizada como redutora da conta de Investimentos no PNC tem natureza credora',
        status: '' },
      { number: 23,
        description: 'A conta de Provisão para Impairment contabilizada como redutora da conta de Imobilizado no PNC tem natureza credora',
        status: '' },
      { number: 24,
        description: 'A conta de Deságio contabilizada como redutora da conta de Investimento no PNC tem natureza credora',
        status: '' },
      { number: 25,
        description: 'A conta Outros Ativos Não Circulantes (OANC) não pode representar mais que 10% do total da conta de Ativo Não Circulante (ANC)',
        status: '' },
      { number: 26,
        description: 'A conta Outros Contas a Receber de Longo Prazo (OCRLP) não pode representar mais que 10% do total da conta de Ativo Não Circulante (ANC)',
        status: '' },
      { number: 27,
        description: 'A conta Outros Passivos Circulantes (OPC) não pode representar mais que 10% do total da conta de Passivo Circulante (PC)',
        status: '' },
      { number: 28,
        description: 'A conta Outros Contas a Pagar (OCP) não pode representar mais que 10% do total da conta de Passivo Circulante (PC)',
        status: '' },
      { number: 29,
        description: 'A conta Outros Passivos Não Circulantes (OPNC) não pode representar mais que 10% do total da conta de Passivo Não Circulante (PNC)',
        status: '' },
      { number: 30,
        description: 'A conta Outros Contas a Pagar de Longo Prazo (OCPLP) não pode representar mais que 10% do total da conta de Passivo Não Circulante (PNC)',
        status: '' },
      { number: 31,
        description: 'A conta de capital social (CS) dentro do Patrimônio Líquido é positiva (i.e.; credora)',
        status: '' },
      { number: 32,
        description: 'A conta de resultado do exercício dentro do Patrimônio Líquido (REPL) é igual ao Lucro/Prejuízo do Exercício ou Resultado do Exercício na DRE (LP)',
        status: '' },
      { number: 33,
        description: 'Nas contas de Receitas, Custos e Despesas, as contas analíticas com nome de "Outros(as)" (CAO) não podem representar mais que 10% da conta sintética (CS) a qual está relacionada',
        status: '' }
    ]
    rules_data
  end
end
