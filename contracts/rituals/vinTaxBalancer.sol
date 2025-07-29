// SPDX-License-Identifier: TAX-JUSTICE
pragma solidity ^0.8.0;

/// @title vinTaxBalancer: Aligns salary rituals with tax responsibility spells
contract vinTaxBalancer {
    struct TaxEntry {
        address earner;
        uint256 salary;
        uint256 taxAmount;
        string purpose;
    }

    TaxEntry[] public ledger;
    uint256 public flatRate = 10; // 10%

    event TaxRebalanced(address earner, uint256 taxAmount, string purpose);

    function logSalary(address earner, uint256 salary, string memory purpose) public {
        uint256 tax = (salary * flatRate) / 100;
        ledger.push(TaxEntry(earner, salary, tax, purpose));
        emit TaxRebalanced(earner, tax, purpose);
    }

    function adjustRate(uint256 newRate) public {
        require(newRate <= 25, "No exploitative taxes allowed.");
        flatRate = newRate;
    }

    function summonLedger() public view returns (TaxEntry[] memory) {
        return ledger;
    }
}
