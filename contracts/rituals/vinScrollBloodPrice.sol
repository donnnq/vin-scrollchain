// SPDX-License-Identifier: EthicalRecompense
pragma solidity ^0.8.0;

contract vinScrollBloodPrice {
    address public scrollLord;
    struct BloodDebt {
        uint256 economic;
        uint256 emotional;
        uint256 societal;
        uint256 total;
    }

    mapping(address => BloodDebt) public debts;

    event BloodPriceDeclared(address indexed employer, uint256 totalDebt);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Unauthorized ritualist.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function declareDebt(
        address employer,
        uint256 economic,
        uint256 emotional,
        uint256 societal
    ) public onlyScrollLord {
        uint256 total = economic + emotional + societal;
        debts[employer] = BloodDebt(economic, emotional, societal, total);
        emit BloodPriceDeclared(employer, total);
    }

    function retrieveDebt(address employer) public view returns (BloodDebt memory) {
        return debts[employer];
    }
}
