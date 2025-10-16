// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicCostBroadcastPack {
    address public admin;

    struct CostBroadcast {
        string districtLabel;
        string projectLabel;
        string costBreakdown;
        string emotionalTag;
        bool aired;
    }

    CostBroadcast[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory districtLabel, string memory projectLabel, string memory costBreakdown, string memory emotionalTag) external onlyAdmin {
        broadcasts.push(CostBroadcast(districtLabel, projectLabel, costBreakdown, emotionalTag, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (CostBroadcast memory) {
        return broadcasts[index];
    }
}
