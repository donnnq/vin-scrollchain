// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExtensionPublisherImmunityDAO {
    address public admin;

    struct PublisherEntry {
        string publisherLabel;
        string immunityClause;
        string emotionalTag;
        bool granted;
    }

    PublisherEntry[] public publishers;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _publisherLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        publishers.push(PublisherEntry(_publisherLabel, _immunityClause, _emotionalTag, false));
    }

    function grantEntry(uint256 index) external onlyAdmin {
        publishers[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (PublisherEntry memory) {
        return publishers[index];
    }
}
