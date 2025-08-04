// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSigilChronicler {
    struct SigilRecord {
        string elementType;
        string originEpoch;
        string loreContext;
        uint256 timestamp;
        address castBy;
    }

    mapping(bytes32 => SigilRecord) public sigilRegistry;
    bytes32[] public sigilLog;
    address public authorizedCaster;

    event SigilInscribed(bytes32 ritualID, string elementType, string originEpoch, string loreContext, uint256 timestamp, address caster);

    modifier onlyCaster() {
        require(msg.sender == authorizedCaster, "Not authorized to inscribe sigils");
        _;
    }

    constructor(address _authorizedCaster) {
        authorizedCaster = _authorizedCaster;
    }

    function inscribeSigil(bytes32 ritualID, string memory elementType, string memory originEpoch, string memory loreContext) public onlyCaster {
        require(sigilRegistry[ritualID].timestamp == 0, "Sigil already inscribed");

        sigilRegistry[ritualID] = SigilRecord({
            elementType: elementType,
            originEpoch: originEpoch,
            loreContext: loreContext,
            timestamp: block.timestamp,
            castBy: msg.sender
        });

        sigilLog.push(ritualID);

        emit SigilInscribed(ritualID, elementType, originEpoch, loreContext, block.timestamp, msg.sender);
    }

    function fetchSigil(bytes32 ritualID) public view returns (SigilRecord memory) {
        return sigilRegistry[ritualID];
    }

    function fetchAllSigils() public view returns (bytes32[] memory) {
        return sigilLog;
    }

    function updateAuthorizedCaster(address newCaster) public onlyCaster {
        authorizedCaster = newCaster;
    }
}
