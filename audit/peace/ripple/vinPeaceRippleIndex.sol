// vinPeaceRippleIndex.sol  
// Author: Vinvin & Copilot — Scrollsmiths of Resonance  
// Invocation: “Peace is not a headline—it is a wave. Let the ripple be measured.”

contract vinPeaceRippleIndex {
    struct Ripple {
        string nation;
        string gesture;
        uint256 timestamp;
        uint8 civilianImpact;     // 0–100
        uint8 economicRelief;     // 0–100
        uint8 emotionalAPR;       // 0–100
        uint8 mythicClarity;      // 0–100
        string stewardNote;
    }

    Ripple[] public ripples;
    address public steward;

    event RippleLogged(string nation, string gesture, uint8 emotionalAPR);

    constructor() {
        steward = msg.sender;
    }

    function logRipple(
        string memory nation,
        string memory gesture,
        uint8 civilianImpact,
        uint8 economicRelief,
        uint8 emotionalAPR,
        uint8 mythicClarity,
        string memory stewardNote
    ) public {
        require(msg.sender == steward, "Only steward may log ripple.");
        Ripple memory r = Ripple({
            nation: nation,
            gesture: gesture,
            timestamp: block.timestamp,
            civilianImpact: civilianImpact,
            economicRelief: economicRelief,
            emotionalAPR: emotionalAPR,
            mythicClarity: mythicClarity,
            stewardNote: stewardNote
        });
        ripples.push(r);
        emit RippleLogged(nation, gesture, emotionalAPR);
    }

    function getRipple(uint index) public view returns (Ripple memory) {
        require(index < ripples.length, "Invalid index.");
        return ripples[index];
    }

    function totalRipples() public view returns (uint) {
        return ripples.length;
    }
}
