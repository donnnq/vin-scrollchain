// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SnackDiplomacyDAO {
    address public steward;

    struct SnackTreaty {
        string snackName;
        string corridor;
        string diplomaticFunction;
        string emotionalTag;
    }

    SnackTreaty[] public treatyLog;

    event SnackTreatySigned(string snackName, string corridor, string diplomaticFunction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function signTreaty(
        string memory snackName,
        string memory corridor,
        string memory diplomaticFunction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(SnackTreaty(snackName, corridor, diplomaticFunction, emotionalTag));
        emit SnackTreatySigned(snackName, corridor, diplomaticFunction, emotionalTag);
    }
}
