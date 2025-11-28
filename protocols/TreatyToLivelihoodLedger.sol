// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToLivelihoodLedger {
    string public batchID = "1321.9.167";
    string public steward = "Vinvin";

    address public admin;

    struct LivelihoodAction {
        string measure;     // subsidy, lane access, training
        string beneficiary; // driver, operator
        uint256 timestamp;
    }

    LivelihoodAction[] public actions;

    event LivelihoodLogged(string measure, string beneficiary);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logLivelihood(string memory measure, string memory beneficiary) public onlyAdmin {
        actions.push(LivelihoodAction(measure, beneficiary, block.timestamp));
        emit LivelihoodLogged(measure, beneficiary);
    }

    function getLivelihood(uint256 index) public view returns (string memory measure, string memory beneficiary, uint256 timestamp) {
        LivelihoodAction memory l = actions[index];
        return (l.measure, l.beneficiary, l.timestamp);
    }
}
