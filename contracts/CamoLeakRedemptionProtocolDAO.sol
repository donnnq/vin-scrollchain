// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CamoLeakRedemptionProtocolDAO {
    address public admin;

    struct LeakCase {
        string repoName;
        string leakVector;
        string redemptionAction;
        string emotionalTag;
        bool resolved;
    }

    LeakCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logLeak(string memory _repoName, string memory _leakVector, string memory _redemptionAction, string memory _emotionalTag) external onlyAdmin {
        cases.push(LeakCase(_repoName, _leakVector, _redemptionAction, _emotionalTag, false));
    }

    function markResolved(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getLeak(uint256 index) external view returns (LeakCase memory) {
        return cases[index];
    }
}
