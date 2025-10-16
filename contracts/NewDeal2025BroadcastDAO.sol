// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NewDeal2025BroadcastDAO {
    address public admin;

    struct PolicyBroadcast {
        string policyLabel;
        string reformType;
        string emotionalTag;
        bool aired;
    }

    PolicyBroadcast[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory policyLabel, string memory reformType, string memory emotionalTag) external onlyAdmin {
        broadcasts.push(PolicyBroadcast(policyLabel, reformType, emotionalTag, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (PolicyBroadcast memory) {
        return broadcasts[index];
    }
}
