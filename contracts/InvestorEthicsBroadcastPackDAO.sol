// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvestorEthicsBroadcastPackDAO {
    address public admin;

    struct BroadcastEntry {
        string investorLabel;
        string ethicsClause;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _investorLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_investorLabel, _ethicsClause, _emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
