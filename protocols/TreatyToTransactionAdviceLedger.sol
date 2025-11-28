// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTransactionAdviceLedger {
    string public batchID = "1321.9.175";
    string public steward = "Vinvin";

    address public admin;

    struct TransactionAdvice {
        string investorName;
        string action;     // subscribe, redeem
        uint256 units;
        uint256 navpu;
        uint256 timestamp;
    }

    TransactionAdvice[] public advices;

    event AdviceLogged(string investorName, string action, uint256 units, uint256 navpu);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAdvice(string memory investorName, string memory action, uint256 units, uint256 navpu) public onlyAdmin {
        advices.push(TransactionAdvice(investorName, action, units, navpu, block.timestamp));
        emit AdviceLogged(investorName, action, units, navpu);
    }

    function getAdvice(uint256 index) public view returns (string memory investorName, string memory action, uint256 units, uint256 navpu, uint256 timestamp) {
        TransactionAdvice memory a = advices[index];
        return (a.investorName, a.action, a.units, a.navpu, a.timestamp);
    }
}
