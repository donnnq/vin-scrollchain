// Animal Protection Shield – ethical mana aura
contract vinAnimalSanctuaryField {
    uint256 public rescueCount;
    bool public sanctuaryAuraActive;

    constructor() {
        sanctuaryAuraActive = true;
        rescueCount = 0;
    }

    function rescueAnimal() public {
        rescueCount++;
    }

    function getSanctuaryStrength() public view returns (uint256) {
        return rescueCount * 33; // Each rescue multiplies aura resonance
    }
}
