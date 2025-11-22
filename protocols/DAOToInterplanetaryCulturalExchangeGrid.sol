// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToInterplanetaryCulturalExchangeGrid {
    string public batchID = "1321.9.111";
    string public steward = "Vinvin";

    address public admin;

    struct Exchange {
        string partner; // e.g., "non-human civilization"
        string domain;  // art, science, language
        uint256 timestamp;
        bool active;
    }

    mapping(bytes32 => Exchange) public exchanges;

    event ExchangeInitiated(bytes32 indexed key, string partner, string domain);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function initiateExchange(string memory partner, string memory domain) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(partner, domain, block.timestamp));
        exchanges[key] = Exchange(partner, domain, block.timestamp, true);
        emit ExchangeInitiated(key, partner, domain);
    }

    function getExchange(bytes32 key) public view returns (string memory partner, string memory domain, uint256 timestamp, bool active) {
        Exchange memory e = exchanges[key];
        return (e.partner, e.domain, e.timestamp, e.active);
    }
}
