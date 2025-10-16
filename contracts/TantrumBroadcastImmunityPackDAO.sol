// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TantrumBroadcastImmunityPackDAO {
    address public admin;

    struct BroadcastEntry {
        string tantrumLabel;
        string immunityClause;
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

    function submitEntry(string memory _tantrumLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_tantrumLabel, _immunityClause, _emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
