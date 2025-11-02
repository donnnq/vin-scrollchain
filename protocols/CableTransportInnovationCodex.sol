// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CableTransportInnovationCodex {
    address public steward;

    struct TransportClause {
        string city;
        string transportType;
        string innovationPartner;
        string emotionalTag;
    }

    TransportClause[] public codex;

    event TransportLogged(string city, string transportType, string innovationPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logTransport(
        string memory city,
        string memory transportType,
        string memory innovationPartner,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(TransportClause(city, transportType, innovationPartner, emotionalTag));
        emit TransportLogged(city, transportType, innovationPartner, emotionalTag);
    }
}
