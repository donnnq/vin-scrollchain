// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EastAsiaDevelopmentProtocolDAO {
    address public admin;

    struct ProtocolEntry {
        string countryModel;
        string policyPillar;
        string adaptationStrategy;
        string emotionalTag;
        bool adopted;
    }

    ProtocolEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _countryModel, string memory _policyPillar, string memory _adaptationStrategy, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_countryModel, _policyPillar, _adaptationStrategy, _emotionalTag, false));
    }

    function adoptProtocol(uint256 index) external onlyAdmin {
        protocols[index].adopted = true;
    }

    function getProtocol(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
