// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExportSovereigntyCodex {
    address public steward;

    struct ExportClause {
        string productType;
        string foreignDependency;
        string sovereigntyProtocol;
        string emotionalTag;
    }

    ExportClause[] public codex;

    event ExportSovereigntyTagged(string productType, string foreignDependency, string sovereigntyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagExport(
        string memory productType,
        string memory foreignDependency,
        string memory sovereigntyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ExportClause(productType, foreignDependency, sovereigntyProtocol, emotionalTag));
        emit ExportSovereigntyTagged(productType, foreignDependency, sovereigntyProtocol, emotionalTag);
    }
}
