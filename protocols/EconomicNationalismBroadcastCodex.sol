// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EconomicNationalismBroadcastCodex {
    address public steward;

    struct CampaignClause {
        string campaignName;
        string manufacturingFocus;
        string skilledLaborSignal;
        string supplyChainProtocol;
        string emotionalTag;
    }

    CampaignClause[] public codex;

    event EconomicNationalismBroadcasted(string campaignName, string manufacturingFocus, string skilledLaborSignal, string supplyChainProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastCampaign(
        string memory campaignName,
        string memory manufacturingFocus,
        string memory skilledLaborSignal,
        string memory supplyChainProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(CampaignClause(campaignName, manufacturingFocus, skilledLaborSignal, supplyChainProtocol, emotionalTag));
        emit EconomicNationalismBroadcasted(campaignName, manufacturingFocus, skilledLaborSignal, supplyChainProtocol, emotionalTag);
    }
}
