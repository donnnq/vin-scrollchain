// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfluencerFundTransparencyProtocolDAO {
    address public admin;

    struct ProtocolEntry {
        string influencerName;
        string fundName;
        string transparencyClause;
        string emotionalTag;
        bool published;
    }

    ProtocolEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _influencerName, string memory _fundName, string memory _transparencyClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_influencerName, _fundName, _transparencyClause, _emotionalTag, false));
    }

    function publishProtocol(uint256 index) external onlyAdmin {
        protocols[index].published = true;
    }

    function getProtocol(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
