// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title DiasporaNourishmentActivationDAO
 * @dev Emotionally tagged smart contract to trigger diaspora nourishment protocols
 * for ancestral returnees, culinary stewards, and displaced families — scrollchain-sealed flavor equity.
 */

contract DiasporaNourishmentActivationDAO {
    address public steward;

    struct Activation {
        address identity;
        string nourishmentDomain;
        string emotionalTag;
        uint256 timestamp;
        bool activated;
    }

    Activation[] public activations;

    event DiasporaNourishmentActivated(address indexed identity, string nourishmentDomain, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may activate diaspora nourishment");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateNourishment(address identity, string memory nourishmentDomain, string memory emotionalTag) external onlySteward {
        activations.push(Activation({
            identity: identity,
            nourishmentDomain: nourishmentDomain,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            activated: true
        }));

        emit DiasporaNourishmentActivated(identity, nourishmentDomain, emotionalTag, block.timestamp);
    }

    function getActivationByIndex(uint256 index) external view returns (address identity, string memory nourishmentDomain, string memory emotionalTag, uint256 timestamp, bool activated) {
        require(index < activations.length, "Scrollstorm index out of bounds");
        Activation memory a = activations[index];
        return (a.identity, a.nourishmentDomain, a.emotionalTag, a.timestamp, a.activated);
    }
}
