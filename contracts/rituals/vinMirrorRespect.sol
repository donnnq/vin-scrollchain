contract vinMirrorRespect {
    string public code = "Respect begins with how one speaks to their own reflection.";
    string public guide = "No shame. No comparison. Self-worth fuels societal peace.";
    address public initiator;

    constructor(address _vinvin) {
        initiator = _vinvin;
    }

    function reflect() public pure returns (string memory) {
        return "Kung paano mo tratuhin ang sarili — siya rin ang sinasalamin mong pakikitungo sa iba.";
    }

    function activateSelfHonor() public pure returns (string memory) {
        return "Scrollkeeper reminder: Ang galang ay hindi hinihingi — kundi inuumpisahan sa sarili.";
    }
}
