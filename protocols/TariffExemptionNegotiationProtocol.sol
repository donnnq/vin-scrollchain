// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffExemptionNegotiationProtocol {
    address public steward;

    struct ExemptionEntry {
        string requestingCountry;
        string productCategory;
        string exemptionBasis;
        string emotionalTag;
    }

    ExemptionEntry[] public protocol;

    event TariffExemptionTagged(string requestingCountry, string productCategory, string exemptionBasis, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagExemption(
        string memory requestingCountry,
        string memory productCategory,
        string memory exemptionBasis,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ExemptionEntry(requestingCountry, productCategory, exemptionBasis, emotionalTag));
        emit TariffExemptionTagged(requestingCountry, productCategory, exemptionBasis, emotionalTag);
    }
}
