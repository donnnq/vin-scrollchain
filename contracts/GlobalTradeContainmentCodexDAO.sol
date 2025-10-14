// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalTradeContainmentCodexDAO {
    address public admin;

    struct ContainmentEntry {
        string commodity;
        string targetRegion;
        string containmentMeasure;
        string emotionalTag;
        bool activated;
    }

    ContainmentEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _commodity, string memory _targetRegion, string memory _containmentMeasure, string memory _emotionalTag) external onlyAdmin {
        codex.push(ContainmentEntry(_commodity, _targetRegion, _containmentMeasure, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        codex[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (ContainmentEntry memory) {
        return codex[index];
    }
}
