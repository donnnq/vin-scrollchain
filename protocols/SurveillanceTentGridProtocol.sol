// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SurveillanceTentGridProtocol {
    address public steward;

    struct TentNode {
        string tentID;
        string corridor;
        string visibilityRange;
        string emotionalTag;
    }

    TentNode[] public grid;

    event TentDeployed(string tentID, string corridor, string visibilityRange, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function deployTent(
        string memory tentID,
        string memory corridor,
        string memory visibilityRange,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(TentNode(tentID, corridor, visibilityRange, emotionalTag));
        emit TentDeployed(tentID, corridor, visibilityRange, emotionalTag);
    }
}
