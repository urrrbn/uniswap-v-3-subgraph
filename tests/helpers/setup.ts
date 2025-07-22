import { clearStore } from "matchstick-as/assembly/index"

// Test setup helper - call before each test to ensure clean state
export function beforeEach(): void {
  clearStore()
}