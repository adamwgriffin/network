<template>
  <header class="flex items-end gap-24 p-6">
    <NuxtLink to="/">
      <h1 class="text-3xl font-bold">Network 🧑‍⚕️👩‍⚕️</h1>
      <p>The ultimate doctors network&trade;</p>
    </NuxtLink>
    <nav>
      <ul class="flex gap-6">
        <li>
          <NavLink icon-name="lucide-lab:house" to="/">Home</NavLink>
        </li>
        <li>
          <NavLink icon-name="lucide:users" to="/mynetwork">My Network</NavLink>
        </li>
        <li>
          <UserMenu />
        </li>
      </ul>
    </nav>
  </header>
</template>
