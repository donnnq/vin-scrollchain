// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinTaxJusticeScroll {
    struct TaxCase {
        string contractorName;
        uint declaredRevenue;
        uint estimatedContractValue;
        string lgusInvolved;
        bool caseFiled;
    }

    TaxCase[] public cases;

    event TaxCaseLogged(string contractor, uint declaredRevenue, uint estimatedValue);

    function logTaxCase(
        string memory name,
        uint revenue,
        uint contractValue,
        string memory lgus,
        bool filed
    ) public {
        cases.push(TaxCase(name, revenue, contractValue, lgus, filed));
        emit TaxCaseLogged(name, revenue, contractValue);
    }

    function getTaxCase(uint index) public view returns (TaxCase memory) {
        return cases[index];
    }
}
